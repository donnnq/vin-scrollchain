// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerSignalDAO {
    address public admin;

    struct SignalEntry {
        string whistleblowerName;
        string issue;
        string urgencyClause;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
        bool sealed;
    }

    SignalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSignal(string memory whistleblowerName, string memory issue, string memory urgencyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SignalEntry(whistleblowerName, issue, urgencyClause, emotionalTag, true, false, false));
    }

    function confirmAcknowledgement(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealSignalEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getSignalEntry(uint256 index) external view returns (SignalEntry memory) {
        return entries[index];
    }
}
