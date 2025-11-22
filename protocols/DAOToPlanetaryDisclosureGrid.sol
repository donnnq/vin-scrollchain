// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToPlanetaryDisclosureGrid {
    string public batchID = "1321.9.108";
    string public steward = "Vinvin";

    address public admin;

    struct Disclosure {
        string evidenceTag;
        string origin;
        uint256 timestamp;
        bool publicized;
    }

    mapping(bytes32 => Disclosure) public disclosureRegistry;

    event DisclosureLogged(bytes32 indexed key, string evidenceTag, string origin);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDisclosure(string memory evidenceTag, string memory origin) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(evidenceTag, origin, block.timestamp));
        disclosureRegistry[key] = Disclosure(evidenceTag, origin, block.timestamp, true);
        emit DisclosureLogged(key, evidenceTag, origin);
    }

    function getDisclosure(bytes32 key) public view returns (string memory evidenceTag, string memory origin, uint256 timestamp, bool publicized) {
        Disclosure memory d = disclosureRegistry[key];
        return (d.evidenceTag, d.origin, d.timestamp, d.publicized);
    }
}
