// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AltcoinSeasonCatalystDAO {
    address public steward;

    struct CatalystSignal {
        string altcoin;
        string corridor;
        string catalystType;
        string emotionalTag;
    }

    CatalystSignal[] public registry;

    event CatalystActivated(string altcoin, string corridor, string catalystType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function activateCatalyst(
        string memory altcoin,
        string memory corridor,
        string memory catalystType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CatalystSignal(altcoin, corridor, catalystType, emotionalTag));
        emit CatalystActivated(altcoin, corridor, catalystType, emotionalTag);
    }
}
