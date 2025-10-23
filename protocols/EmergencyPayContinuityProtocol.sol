// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencyPayContinuityProtocol {
    address public steward;

    struct PayEntry {
        string agencyName;
        string workerType; // "Essential", "Contractual", "Support staff"
        uint256 monthlyPay;
        string continuityMethod; // "Auto-disbursement", "Emergency fund", "Crypto bridge"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    PayEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployPay(string memory agencyName, string memory workerType, uint256 monthlyPay, string memory continuityMethod, string memory emotionalTag) external onlySteward {
        entries.push(PayEntry(agencyName, workerType, monthlyPay, continuityMethod, emotionalTag, true, false));
    }

    function sealPayEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getPayEntry(uint256 index) external view returns (PayEntry memory) {
        return entries[index];
    }
}
