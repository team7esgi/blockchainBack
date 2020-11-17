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

        surface = _surface;
        category = _category;
        nbRoom = _nbRoom;
        nbBedRoom = _nbBedRoom;
        about = _about;
        title = _title;
        streetName = _streetName;
        price = _price;

    }



}
