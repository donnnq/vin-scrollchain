// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract CodexToCommunalTrustSafeguard {
    string public batchID = "1321.9.192";
    string public steward = "Vinvin";

    address public admin;

    struct Safeguard {
        string principle;     // transparency, accountability, dignity
        string description;
        uint256 timestamp;
    }

    Safeguard[] public safeguards;

    event SafeguardCodified(string principle, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifySafeguard(string memory principle, string memory description) public onlyAdmin {
        safeguards.push(Safeguard(principle, description, block.timestamp));
        emit SafeguardCodified(principle, description);
    }

    function getSafeguard(uint256 index) public view returns (string memory principle, string memory description, uint256 timestamp) {
        Safeguard memory s = safeguards[index];
        return (s.principle, s.description, s.timestamp);
    }
}
