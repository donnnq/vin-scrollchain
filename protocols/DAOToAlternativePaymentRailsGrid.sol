// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToAlternativePaymentRailsGrid {
    string public batchID = "1321.9.118";
    string public steward = "Vinvin";

    address public admin;

    struct Rail {
        string type; // crypto, DeFi, local fintech
        string provider;
        uint256 timestamp;
        bool active;
    }

    mapping(bytes32 => Rail) public rails;

    event RailLogged(bytes32 indexed key, string type, string provider);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRail(string memory type, string memory provider) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(type, provider, block.timestamp));
        rails[key] = Rail(type, provider, block.timestamp, true);
        emit RailLogged(key, type, provider);
    }

    function getRail(bytes32 key) public view returns (string memory type, string memory provider, uint256 timestamp, bool active) {
        Rail memory r = rails[key];
        return (r.type, r.provider, r.timestamp, r.active);
    }
}
