pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract EstateFactory {


    struct Estate{
        string  surface;
        string category;
        uint8 nbRoom;
        uint8 nbBedRoom;
        Other[] others;
        string about;
        string title;
        string streetName;
        uint16 price;

    }

    struct Other{
        string item;
        string description;
    }

    function createEstate( string memory _surface, string memory  _category, uint8  _nbRoom, uint8 _nbBedRoom,
            string memory  _about, string memory  _title,
            string memory _streetName, uint16 _price) public {

        Estate memory newEstate;

        newEstate.surface = _surface;
        newEstate.category = _category;
        newEstate.nbRoom = _nbRoom;
        newEstate.nbBedRoom = _nbBedRoom;
        newEstate.about = _about;
        newEstate.title = _title;
        newEstate.streetName = _streetName;
        newEstate.price = _price;

    }



}
