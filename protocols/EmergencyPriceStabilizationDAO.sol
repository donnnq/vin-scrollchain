// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencyPriceStabilizationDAO {
    address public steward;

    struct StabilizationEntry {
        string barangay;
        string commodity;
        string stabilizationProtocol;
        string emotionalTag;
    }

    StabilizationEntry[] public registry;

    event EmergencyPriceStabilized(string barangay, string commodity, string stabilizationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function stabilizePrice(
        string memory barangay,
        string memory commodity,
        string memory stabilizationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(StabilizationEntry(barangay, commodity, stabilizationProtocol, emotionalTag));
        emit EmergencyPriceStabilized(barangay, commodity, stabilizationProtocol, emotionalTag);
    }
}
