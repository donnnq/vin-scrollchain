// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IPCToContractorSubpoenaGrid {
    address public steward;

    struct SubpoenaEntry {
        string contractorName; // "FloodTech Builders Inc."
        string anomalyType; // "Ghost bidding", "Overpricing", "Fund diversion"
        string subpoenaMethod; // "IPC mandate", "Scrollchain summons", "Senate referral"
        string emotionalTag;
        bool summoned;
        bool sealed;
    }

    SubpoenaEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function summonContractor(string memory contractorName, string memory anomalyType, string memory subpoenaMethod, string memory emotionalTag) external onlySteward {
        entries.push(SubpoenaEntry(contractorName, anomalyType, subpoenaMethod, emotionalTag, true, false));
    }

    function sealSubpoenaEntry(uint256 index) external onlySteward {
        require(entries[index].summoned, "Must be summoned first");
        entries[index].sealed = true;
    }

    function getSubpoenaEntry(uint256 index) external view returns (SubpoenaEntry memory) {
        return entries[index];
    }
}
