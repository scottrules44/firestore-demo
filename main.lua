local firestore = require("plugin.firestore")
local widget = require("widget")
local json = require("json")

firestore.init(projectId, apiKey, applicationId) -- see docs, but you get this info for android in google-services.json


--functions
local showLogin
local showAccount
--
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 0,0,.5 )

local title = display.newText( "Firestore Plugin", display.contentCenterX, 40, native.systemFontBold, 20 )

local getDataInDocument
getDataInDocument = widget.newButton( {
    x = display.contentCenterX,
    y= display.contentCenterY-60,
    label = "Get Data In Document",
    onPress = function()
        getDataInDocument.alpha = .3
    end,
    onRelease = function (  )
        getDataInDocument.alpha = 1
        firestore.readDataInDocument("cities", "LA", function ( e )
            if (e.isError == true) then
                native.showAlert("Error", e.error,{"Ok"})
            else
                native.showAlert("Got Data", json.encode(e.data),{"Ok"})
            end

        end)
    end
} )
local getDataFromCollection
getDataFromCollection = widget.newButton( {
    x = display.contentCenterX,
    y= display.contentCenterY-20,
    label = "Get Data from collection",
    onPress = function()
        getDataFromCollection.alpha = .3
    end,
    onRelease = function (  )
        getDataFromCollection.alpha = 1
        firestore.readDataInCollection("cities", function ( e )
            if (e.isError == true) then
                native.showAlert("Error", e.error,{"Ok"})
            else
                native.showAlert("Got Data", json.encode(e.data),{"Ok"})
            end
            
        end)
    end
} )
local setData
setData = widget.newButton( {
    x = display.contentCenterX ,
    y= display.contentCenterY+ 20,
    label = "Set Data",
    onPress = function()
        setData.alpha = .3
    end,
    onRelease = function (  )
        setData.alpha = 1
        firestore.setData("cities", "LA", {name = "Los Angeles", population = 4000000}, function ( e )
            if (e.isError == true) then
                native.showAlert("Error", e.error,{"Ok"})
            else
                native.showAlert("Sent Data", "",{"Ok"})
            end
            
        end)
    firestore.setData("cities", "NY", {name = "New York", population = 8623000}, function ( e )
        if (e.isError == true) then
            native.showAlert("Error", e.error,{"Ok"})
        else
            native.showAlert("Data Sent", "",{"Ok"})
        end

        end)
    end
} )
local updateData
updateData = widget.newButton( {
    x = display.contentCenterX ,
    y= display.contentCenterY+ 60,
    label = "Update Data",
        onPress = function()
            updateData.alpha = .3
        end,
        onRelease = function (  )
            updateData.alpha = 1
            firestore.updateData("cities", "LA", {population = 4000001}, function ( e )
                if (e.isError == true) then
                    native.showAlert("Error", e.error,{"Ok"})
                else
                    native.showAlert("Data updated", "",{"Ok"})
                end

            end)
    end
} )
local deleteData
deleteData = widget.newButton( {
    x = display.contentCenterX ,
    y= display.contentCenterY+ 100,
    label = "Delete Data",
    onPress = function()
        deleteData.alpha = .3
    end,
    onRelease = function (  )
        deleteData.alpha = 1
        firestore.deleteData("cities", "LA", "population", function ( e )
            if (e.isError == true) then
                native.showAlert("Error", e.error,{"Ok"})
            else
                native.showAlert("Data Deleted", "",{"Ok"})
            end
        end)
    end
} )
local checkData
checkData = widget.newButton( {
    x = display.contentCenterX ,
    y= display.contentCenterY+ 140,
    label = "Check Data Realtime",
    onPress = function()
        checkData.alpha = .3
    end,
    onRelease = function (  )
        checkData.alpha = 1
        firestore.checkRealtime("cities", "LA", function ( e )
            if (e.isError == true) then
                native.showAlert("Error", e.error,{"Ok"})
            else
                native.showAlert("Data Updated", json.encode(e.data),{"Ok"})
            end
        end)
    end
} )
local stopDataCheck
stopDataCheck = widget.newButton( {
    x = display.contentCenterX ,
    y= display.contentCenterY+ 180,
    label = "Stop Realtime",
    onPress = function()
        stopDataCheck.alpha = .3
    end,
    onRelease = function (  )
        stopDataCheck.alpha = 1
        firestore.stopRealtime()
    end
} )
