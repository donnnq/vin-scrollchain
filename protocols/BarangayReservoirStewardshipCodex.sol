// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayReservoirStewardshipCodex {
    address public steward;

    struct ReservoirEntry {
        string barangay;
        string reservoirType;
        string stewardshipProtocol;
        string emotionalTag;
    }

    ReservoirEntry[] public codex;

    event ReservoirStewardTagged(string barangay, string reservoirType, string stewardshipProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReservoir(
        string memory barangay,
        string memory reservoirType,
        string memory stewardshipProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ReservoirEntry(barangay, reservoirType, stewardshipProtocol, emotionalTag));
        emit ReservoirStewardTagged(barangay, reservoirType, stewardshipProtocol, emotionalTag);
    }
}
