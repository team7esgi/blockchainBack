pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract EstateFactory {


    struct Estate{
        uint8  surface;
        string category;
        uint8 nbRoom;
        uint8 nbBedRoom;
        Other[] others;
        string about;
        string title;
        Street street;

        uint16 price;

    }

    struct Other{
        string item;
        string description;
    }

    struct Street{
        string rue;
        string nom;
        string codePostale;
        string ville;
        string pays;
    }

    function createEstate( uint8  _surface, string memory  _category, uint8  _nbRoom, uint8 _nbBedRoom,
            string memory  _about, string memory  _title,
            Street memory _street, uint16 _price) public {

        Estate memory newEstate;

        newEstate.surface = _surface;
        newEstate.category = _category;
        newEstate.nbRoom = _nbRoom;
        newEstate.nbBedRoom = _nbBedRoom;
        newEstate.about = _about;
        newEstate.title = _title;
        newEstate.street = _street;
        newEstate.price = _price;

    }



}
