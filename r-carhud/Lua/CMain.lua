
Citizen.CreateThread(function()
   while true do 
       Wait(100)
       sleep = true 
       local p = PlayerPedId();
       local pc = GetEntityCoords(p)
       local v = GetVehiclePedIsIn(p, false);
       local speed = GetEntitySpeed(v)*3.6;
       local healtv = GetVehicleEngineHealth(v);
       local street = {}
       local cA = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, pc.x, pc.y, pc.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        if IsPedInAnyVehicle(PlayerPedId()) then
         _fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId()))
        else
         _fuel = 0
        end
        if cA ~= 0 then 
            table.insert(street, GetStreetNameFromHashKey(cA))
        end
       if v then 
        sleep = false 
        SendNUIMessage({
            InVehicle = v; 
            speed = speed;
            healt = healtv; 
            fuel = _fuel;
            streetName = street;
        })
    end
    if sleep then Wait(1200) end
   end
end)
