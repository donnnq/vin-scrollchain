// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPowerEquityLedger {
    string public batchID = "1321.9.194";
    string public steward = "Vinvin";

    address public admin;

    struct PowerAccess {
        string community;   // rural, urban, coastal
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    PowerAccess[] public accesses;

    event PowerLogged(string community, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPower(string memory community, string memory status) public onlyAdmin {
        accesses.push(PowerAccess(community, status, block.timestamp));
        emit PowerLogged(community, status);
    }

    function getPower(uint256 index) public view returns (string memory community, string memory status, uint256 timestamp) {
        PowerAccess memory p = accesses[index];
        return (p.community, p.status, p.timestamp);
    }
}
