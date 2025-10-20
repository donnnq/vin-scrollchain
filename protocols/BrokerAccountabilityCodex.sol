// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BrokerAccountabilityCodex {
    address public admin;

    struct BrokerEntry {
        string brokerName;
        string country;
        string violationClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    BrokerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBrokerAudit(string memory brokerName, string memory country, string memory violationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BrokerEntry(brokerName, country, violationClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealBrokerEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getBrokerEntry(uint256 index) external view returns (BrokerEntry memory) {
        return entries[index];
    }
}
