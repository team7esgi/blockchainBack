pragma solidity >=0.4.22 <0.8.0;

import "./Ownable.sol";
pragma experimental ABIEncoderV2;

contract EstateFactory is Ownable {


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

    Estate[] estates;

    mapping (uint => address) public estateToOwner;

    mapping ( address =>uint[] ) public OwnerToEstates;

    function createEstate( uint8  _surface, string memory  _category, uint8  _nbRoom, uint8 _nbBedRoom,
            string memory  _about, string memory  _title,
            Street memory _street, uint16 _price) internal {

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
