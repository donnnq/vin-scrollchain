// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InflationResistanceSignalIndex {
    address public steward;

    struct SignalEntry {
        string barangay;
        string commodity;
        string resistanceProtocol;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event InflationResistanceTagged(string barangay, string commodity, string resistanceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResistance(
        string memory barangay,
        string memory commodity,
        string memory resistanceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(barangay, commodity, resistanceProtocol, emotionalTag));
        emit InflationResistanceTagged(barangay, commodity, resistanceProtocol, emotionalTag);
    }
}
