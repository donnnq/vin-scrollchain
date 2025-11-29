// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToInterAgencyVerificationLedger {
    string public batchID = "1321.9.192";
    string public steward = "Vinvin";

    address public admin;

    struct Verification {
        string agency;      // PDEA, PNP, NBI
        string subject;     // agent identity, badge, clearance
        string status;      // verified, disputed, pending
        uint256 timestamp;
    }

    Verification[] public verifications;

    event VerificationLogged(string agency, string subject, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logVerification(string memory agency, string memory subject, string memory status) public onlyAdmin {
        verifications.push(Verification(agency, subject, status, block.timestamp));
        emit VerificationLogged(agency, subject, status);
    }

    function getVerification(uint256 index) public view returns (string memory agency, string memory subject, string memory status, uint256 timestamp) {
        Verification memory v = verifications[index];
        return (v.agency, v.subject, v.status, v.timestamp);
    }
}
