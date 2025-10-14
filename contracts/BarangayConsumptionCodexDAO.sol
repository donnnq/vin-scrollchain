// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayConsumptionCodexDAO {
    address public admin;

    struct ConsumptionEntry {
        string barangay;
        string itemCategory;
        string monthlySpend;
        string emotionalTag;
        bool taggedForRelief;
    }

    ConsumptionEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logConsumption(string memory _barangay, string memory _itemCategory, string memory _monthlySpend, string memory _emotionalTag) external onlyAdmin {
        codex.push(ConsumptionEntry(_barangay, _itemCategory, _monthlySpend, _emotionalTag, false));
    }

    function tagForRelief(uint256 index) external onlyAdmin {
        codex[index].taggedForRelief = true;
    }

    function getConsumption(uint256 index) external view returns (ConsumptionEntry memory) {
        return codex[index];
    }
}
