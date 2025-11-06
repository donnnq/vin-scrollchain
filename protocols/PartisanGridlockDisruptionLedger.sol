// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PartisanGridlockDisruptionLedger {
    address public steward;

    struct GridlockEntry {
        string chamber;
        string disruptionAction;
        string resolutionProtocol;
        string emotionalTag;
    }

    GridlockEntry[] public ledger;

    event GridlockDisrupted(string chamber, string disruptionAction, string resolutionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function disruptGridlock(
        string memory chamber,
        string memory disruptionAction,
        string memory resolutionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(GridlockEntry(chamber, disruptionAction, resolutionProtocol, emotionalTag));
        emit GridlockDisrupted(chamber, disruptionAction, resolutionProtocol, emotionalTag);
    }
}
