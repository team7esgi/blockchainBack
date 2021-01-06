pragma solidity >=0.4.22 <0.8.0;

import "./Ownable.sol";
pragma experimental ABIEncoderV2;

contract EstateFactory is Ownable {

    event NewEstate(
        uint idEstate,
        uint8 surface,
        string category,
        uint8 nbRoom,
        uint8 nbBedRoom,
        string about,
        uint16 price,
        string title,
        string rue, 
        string nom, 
        string codePostale, 
        string ville, 
        string pays);

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

    Estate[] public estates;

    mapping (uint => address) public estateToOwner;
    mapping (address => uint) ownerEstateCount;
    uint8 estateSize;

    function createOther(string _item, string _description) private{
        return Other(_item,_description);
    }

    function createEstate(
        uint8 _surface,
        string memory _category,
        uint8 _nbRoom, 
        uint8 _nbBedRoom,
        string memory _about,
        string memory _title,
        Other[] others,
        uint16 _price,
        string _rue, 
        string _nom, 
        string _codePostale, 
        string _ville, 
        string _pays) internal {

        Estate memory newEstate;

        newEstate.surface = _surface;
        newEstate.category = _category;
        newEstate.nbRoom = _nbRoom;
        newEstate.nbBedRoom = _nbBedRoom;
        newEstate.about = _about;
        newEstate.title = _title;
        newEstate.street = Street(_rue, _nom, _codePostale, _ville, _pays);
        newEstate.price = _price;

        newEstate.others =;

        uint idEstate = estates.push(newEstate) - 1;
        estateToOwner[idEstate] = msg.sender;
        ownerEstateCount[msg.sender]++;
        estateSize+=1;
        NewEstate(idEstate, _surface, _category, _nbRoom, _nbBedRoom, _about, _title, _price, _rue, _nom, _codePostale, _ville, _pays);

    }


    function createOther(string item, string description){

    }






}
