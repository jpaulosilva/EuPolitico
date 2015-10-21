-- $Id: tcp.lua,v 1.1 2009/02/13 15:42:10 root Exp $

--[[
-- TODO:
-- * nao aceita `tcp.execute` reentrante
--]]

local _G, coroutine, event, assert, pairs, type, print
    = _G, coroutine, event, assert, pairs, type, print
local s_sub = string.sub

module 'tcp'

local CONNECTIONS = {}

local current = function ()
    return assert(CONNECTIONS[assert(coroutine.running())])
end

local resume = function (co, ...)
    assert(coroutine.status(co) == 'suspended')
    assert(coroutine.resume(co, ...))
    if coroutine.status(co) == 'dead' then
        CONNECTIONS[co] = nil
    end
end

function handler (evt)
    if evt.class ~= 'tcp' then return end

    if evt.type == 'connect' then

        for co, t in pairs(CONNECTIONS) do
            if (t.waiting == 'connect') and (t.host == evt.host) and (t.port == evt.port) then
                t.connection = evt.connection
                t.waiting = nil
                resume(co)
                break
            end
        end
        return
    end

    if evt.type == 'disconnect' then
        for co, t in pairs(CONNECTIONS) do
            if t.waiting and
               (t.connection == evt.connection) then
                t.waiting = nil
                resume(co, nil, 'disconnected')
            end
        end
        return
    end

    if evt.type == 'data' then

        for co, t in pairs(CONNECTIONS) do

            if (t.waiting == 'data') and
               (t.connection == evt.connection) then
		if (evt.value == 0) then
  		     resume(co, nil)
		else
                    resume(co, evt.value)
                end
            end
		
        end
        return
    end
end
event.register(handler)

function execute (f, ...)
    resume(coroutine.create(f), ...)
end

function connect (host, port)

    local t = {
        host    = host,
        port    = port,
        waiting = 'connect'
    }
    
    CONNECTIONS[coroutine.running()] = t

    event.post {
        class = 'tcp',
        type  = 'connect',
        host  = host,
        port  = port,
    }
    
    return coroutine.yield()
end

function disconnect ()
    local t = current()
    event.post {
        class      = 'tcp',
        type       = 'disconnect',
        connection = assert(t.connection),
    }
end

function send (value)
    local t = current()
        
    if not (t.connection) then
    	return 0
    end

    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = assert(t.connection),
        value      = value,
    }
end

function receive (pattern)

    pattern = pattern or '' -- TODO: '*l'/number
    local t = current()
    t.waiting = 'data'
    t.pattern = pattern
 
   if s_sub(pattern, 1, 2) ~= '*a' then
        return coroutine.yield()
   end

   local all = ''
   while true do
        local ret = coroutine.yield()
        if ret then
            all = all .. ret
        else
            return all
        end
    end
end
