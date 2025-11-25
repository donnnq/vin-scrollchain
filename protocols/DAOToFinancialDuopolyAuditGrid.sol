// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToFinancialDuopolyAuditGrid {
    string public batchID = "1321.9.117";
    string public steward = "Vinvin";

    address public admin;

    struct Partnership {
        string corporation; // Visa or Mastercard
        string partner;     // bank, retailer, fintech
        uint256 timestamp;
        bool active;
    }

    mapping(bytes32 => Partnership) public partnerships;

    event PartnershipLogged(bytes32 indexed key, string corporation, string partner);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPartnership(string memory corporation, string memory partner) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(corporation, partner, block.timestamp));
        partnerships[key] = Partnership(corporation, partner, block.timestamp, true);
        emit PartnershipLogged(key, corporation, partner);
    }

    function getPartnership(bytes32 key) public view returns (string memory corporation, string memory partner, uint256 timestamp, bool active) {
        Partnership memory p = partnerships[key];
        return (p.corporation, p.partner, p.timestamp, p.active);
    }
}
