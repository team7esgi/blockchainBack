pragma solidity 0.8.0;

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
        string description;
        string item;
        string about;
        string title;
        Street street;
        uint16 price;

        //Vente ou Achat

        bool enVente;
        // address payable owner;

    }

    function test() external view returns(address)  {
        return msg.sender;
    }

    function getMsgValue(string memory myvar) external payable returns(uint)  {
        return msg.value;
    }

    Estate[] public estates;

    mapping (uint => address) public estateToOwner;
    mapping (address => uint)  ownerEstateCount;

    /*function createOther(string memory _item, string memory _description) private returns( memory){
        return Other(_item,_description);
    }*/

    function createEstate(
        Estate memory estate ) external {


        //Estate memory newEstate;

        estate.surface = estate.surface;
        estate.category = estate.category;
        estate.nbRoom = estate.nbRoom;
        estate.nbBedRoom = estate.nbBedRoom;
        estate.about = estate.about;
        estate.title = estate.title;
        estate.street = estate.street;
        estate.price = estate.price;

        //newEstate.others =;
        estates.push(estate);
        uint idEstate = estates.length;

        estateToOwner[idEstate] = msg.sender;
        ownerEstateCount[msg.sender]++;
        //emit NewEstate(idEstate, _surface, _category, _nbRoom, _nbBedRoom, _about, _price, _title, _rue, _nom, _codePostale, _ville, _pays);

    }

    function getEstatesByOwner(address _owner) external view returns(uint[] memory){
        uint[] memory result = new uint[](ownerEstateCount[_owner]);
        uint counter = 0;
        //estates[] est vide
        for (uint i=0; i<estates.length; i++) {
            if (estateToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }

    function buyEstateById(uint estateId) external payable {

        require(msg.value == estates[estateId].price, "Somme insufisante");

        //Recuperere le vendeur
        address seller = estateToOwner[estateId];
        address payable sellerPayable = payable (seller);

        //Transfere l'argent
        sellerPayable.transfer(msg.value);

        //Update
        ownerEstateCount[seller]--;
        ownerEstateCount[msg.sender]++;

        estateToOwner[estateId] = msg.sender;
        //Effectuer la transaction d'achat
    }

    function getNumberEstates() external view returns(uint){

        return estates.length;
    }


    /*function createOther(string item, string description){

    }*/







}
