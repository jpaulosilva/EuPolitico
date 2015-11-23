

ObserverApplication =  {
  table_rules_view = {};
  scenes = {},
  current_scene,

  inicialize = function()
    BibliotecaAuxiliarScript.execute('framework.src.util.config.CadastroConfiguracao');
    rulesView = CadastroConfiguracao:getRulesView();

    for i,v in pairs(rulesView)do
      ObserverApplication.addRulesView(v.id,v.value,v.is_default);
    end
  end,

  --Funcao que escuta o evento
  handler = function(evt)
    inicio =  event.uptime();
    --Chama o run em modo protegido (nao sobe os erros!)
    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isEventoPress(evt)) then

      collectgarbage('collect');
      ObserverApplication.run(evt);
      collectgarbage('collect');
      Display.setCurrentFrame(ObserverApplication.current_scene.current_frame);

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isEventoRelease(evt) and Display.currentFrame ~= nil) then
      ObserverApplication.show();
    elseif(BibliotecaAuxiliarEvento.isEventoStart(evt) or BibliotecaAuxiliarEvento.isEventoUsuario(evt)) then
      collectgarbage('collect');
      ObserverApplication.run(evt);
      collectgarbage('collect');
      Display.setCurrentFrame(ObserverApplication.current_scene.current_frame);
      Display.show();

    end
  end,

  show = function()
--    for i,v in pairs(ObserverApplication.scenes)do
--      v:limpar(ObserverApplication.current_scene.current_frame);
--    end
--
--    ObserverApplication.current_scene.current_frame:inicialize();
    
    collectgarbage('collect');
    Display.show();
    collectgarbage('collect');

    local fim = (event.uptime() - inicio)/1000;
    print(fim);
    print('BEFORE: '.. collectgarbage('count'));
    collectgarbage('collect');
    print('AFTER: '..collectgarbage('count'));
  end,

  putScene = function(scene,id)
    if(id ~= nil and ObserverApplication.scenes[id] == nil) then
      ObserverApplication.scenes[id] = scene;
    end
  end,

  addRulesView = function(id,value,default_scene)
    ObserverApplication.table_rules_view[id] = value;

    if(ObserverApplication.current_scene == nil or (default_scene ~= nil and default_scene)) then
      local dados_to_view = BibliotecaAuxiliarTexto.tokenize(ObserverApplication.table_rules_view[id],"#");
      ObserverApplication.setSceneCorrente(dados_to_view[1]);

      if(#dados_to_view == 2 and dados_to_view[2] ~= nil) then
        ObserverApplication.scenes[dados_to_view[1]]:setFrameCorrente(dados_to_view[2]);
      end
    end

  end,

  run = function(evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt)) then

      --verifica se ha valor para a chave scene-frame-key
      local key_rule_scene_frame = ObserverApplication.current_scene.id.."#"..ObserverApplication.current_scene.current_frame.id.."#"..BibliotecaAuxiliarEvento.getTecla(evt);
      local key_rule_scene = ObserverApplication.current_scene.id.."#"..BibliotecaAuxiliarEvento.getTecla(evt);
      local key_rule = BibliotecaAuxiliarEvento.getTecla(evt);

      if(ObserverApplication.table_rules_view[key_rule_scene_frame] ~= nil or
        ObserverApplication.table_rules_view[key_rule_scene] ~= nil or
        ObserverApplication.table_rules_view[key_rule] ~= nil) then
        local value_rule;

        if(ObserverApplication.table_rules_view[key_rule_scene_frame] ~= nil)then
          value_rule = ObserverApplication.table_rules_view[key_rule_scene_frame];
        elseif(ObserverApplication.table_rules_view[key_rule_scene] ~= nil)then
          value_rule = ObserverApplication.table_rules_view[key_rule_scene];
        elseif(ObserverApplication.table_rules_view[key_rule] ~= nil)then
          value_rule = ObserverApplication.table_rules_view[key_rule];
        end

        local dados_to_view = BibliotecaAuxiliarTexto.tokenize(value_rule,"#");
        ObserverApplication.setSceneCorrente(dados_to_view[1]);

        if(dados_to_view[2] ~= nil)then
          ObserverApplication.current_scene:setFrameCorrente(dados_to_view[2]);
        end
      else
        ObserverApplication.current_scene:handler(evt);
      end

      if(evt.rule_key ~= nil) then
        local key_rule_scene_frame = ObserverApplication.current_scene.id.."#"..ObserverApplication.current_scene.current_frame.id.."#"..evt.rule_key;
        local key_rule_scene = ObserverApplication.current_scene.id.."#"..evt.rule_key;
        local key_rule = evt.rule_key;


        if(ObserverApplication.table_rules_view[key_rule_scene_frame] ~= nil or
          ObserverApplication.table_rules_view[key_rule_scene] ~= nil or
          ObserverApplication.table_rules_view[key_rule] ~= nil) then
          local value_rule;

          if(ObserverApplication.table_rules_view[key_rule_scene_frame] ~= nil)then
            value_rule = ObserverApplication.table_rules_view[key_rule_scene_frame];
          elseif(ObserverApplication.table_rules_view[key_rule_scene] ~= nil)then
            value_rule = ObserverApplication.table_rules_view[key_rule_scene];
          elseif(ObserverApplication.table_rules_view[key_rule] ~= nil)then
            value_rule = ObserverApplication.table_rules_view[key_rule];
          end

          local dados_to_view = BibliotecaAuxiliarTexto.tokenize(value_rule,"#");
          ObserverApplication.setSceneCorrente(dados_to_view[1]);

          if(dados_to_view[2] ~= nil)then
            ObserverApplication.current_scene:setFrameCorrente(dados_to_view[2]);
          end

          ObserverApplication.current_scene.current_frame:inicialize();

          evt.rule_key = nil;
        end
      end
    end
  end,

  putKeyToView = function (evt,scene_id,frame_id)
    if(evt~=nil) then
      local key_to_view;
      if(scene_id ~= nil)then
        if(frame_id ~= nil)then
          key_to_view = scene_id.."#"..frame_id;
        else
          key_to_view = scene_id;
        end
      end
      evt['to_view'] = key_to_view;
    end
  end,

  create_key_table_rule = function (scene_id,frame_id, key_rule)

  end,

  setSceneCorrente = function (id_scene_corrente)
    if(ObserverApplication.scenes[id_scene_corrente] ~= nil)then
      ObserverApplication.current_scene = ObserverApplication.scenes[id_scene_corrente];
    end
  end
}

event.register(ObserverApplication.handler);

module("ObserverApplication",package.seeall);
