pragma solidity ^0.8.20;

contract vinChainWealthCustodianSigil {
    address public steward;

    struct Reserve {
        string assetType;
        uint256 quantity;
        string custodian;
        string protectionMechanism;
        string purpose;
        string timestamp;
    }

    Reserve[] public reserves;

    event ReserveEncoded(string assetType, string custodian, string purpose);

    constructor() {
        steward = msg.sender;
    }

    function encodeReserve(
        string memory _assetType,
        uint256 _quantity,
        string memory _custodian,
        string memory _protectionMechanism,
        string memory _purpose,
        string memory _timestamp
    ) public {
        reserves.push(Reserve(
            _assetType,
            _quantity,
            _custodian,
            _protectionMechanism,
            _purpose,
            _timestamp
        ));
        emit ReserveEncoded(_assetType, _custodian, _purpose);
    }

    function getReserve(uint256 _index) public view returns (Reserve memory) {
        require(_index < reserves.length, "Invalid index");
        return reserves[_index];
    }
}
