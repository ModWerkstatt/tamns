function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "db", "waggon", "goods", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

        params = {
			{
				key = "tamnsfake",
				name = _("Fake_tamns_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_tamns_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	
        local hidden = {
			["886_braun_DBAG_fake.mdl"] = true,   
			["886_DB_fake.mdl"] = true,   
			["886_DBAG_fake.mdl"] = true,   
			["886x_DBAG_fake.mdl"] = true,   
			["893_braun_DBAG_fake.mdl"] = true,   
			["893_buehne_braun_DBAG_fake.mdl"] = true,   
			["893_buehne_DB_fake.mdl"] = true,   
			["893_buehne_DBAG_fake.mdl"] = true,   
			["893_DB_fake.mdl"] = true,  
			["893_DBAG_fake.mdl"] = true,           
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/tamns([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["tamnsfake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end
	end
	}
end
