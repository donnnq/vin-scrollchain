// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPensionTransparencyLedger {
    string public batchID = "1321.9.205";
    string public steward = "Vinvin";

    address public admin;

    struct Pension {
        string member;      // SSS contributor, GSIS member
        uint256 amount;     // contribution or payout
        string status;      // verified, pending, ghost
        uint256 timestamp;
    }

    Pension[] public pensions;

    event PensionLogged(string member, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPension(string memory member, uint256 amount, string memory status) public onlyAdmin {
        pensions.push(Pension(member, amount, status, block.timestamp));
        emit PensionLogged(member, amount, status);
    }

    function getPension(uint256 index) public view returns (string memory member, uint256 amount, string memory status, uint256 timestamp) {
        Pension memory p = pensions[index];
        return (p.member, p.amount, p.status, p.timestamp);
    }
}
