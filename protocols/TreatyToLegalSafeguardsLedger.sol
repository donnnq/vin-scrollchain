// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToLegalSafeguardsLedger {
    string public batchID = "1321.9.189";
    string public steward = "Vinvin";

    address public admin;

    struct Safeguard {
        string principle;   // due process, equal protection, transparency
        string description;
        uint256 timestamp;
    }

    Safeguard[] public safeguards;

    event SafeguardLogged(string principle, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSafeguard(string memory principle, string memory description) public onlyAdmin {
        safeguards.push(Safeguard(principle, description, block.timestamp));
        emit SafeguardLogged(principle, description);
    }

    function getSafeguard(uint256 index) public view returns (string memory principle, string memory description, uint256 timestamp) {
        Safeguard memory s = safeguards[index];
        return (s.principle, s.description, s.timestamp);
    }
}
