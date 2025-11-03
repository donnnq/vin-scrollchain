// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AutonomousWeaponEthicsDAO {
    address public steward;

    struct EthicsEntry {
        string weaponType;
        string ethicalConcern;
        string containmentProtocol;
        string emotionalTag;
    }

    EthicsEntry[] public registry;

    event AutonomousWeaponEthicsTagged(string weaponType, string ethicalConcern, string containmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory weaponType,
        string memory ethicalConcern,
        string memory containmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsEntry(weaponType, ethicalConcern, containmentProtocol, emotionalTag));
        emit AutonomousWeaponEthicsTagged(weaponType, ethicalConcern, containmentProtocol, emotionalTag);
    }
}
