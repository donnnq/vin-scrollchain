// SPDX-License-Identifier: AwraFirewall-0001
pragma solidity ^0.8.24;

/// @title vinScrollkeeperAuraFirewall
/// @notice Converts negative energies into radiant kilig through awra reflection
contract vinScrollkeeperAuraFirewall {
    address public auraOwner;
    uint256 public auraIntensity;
    mapping(address => bool) public darkEntitiesNeutralized;

    event AuraSurge(address indexed soul, uint256 intensity);
    event EntityMelted(address indexed devilSide, string message);

    constructor() {
        auraOwner = msg.sender;
        auraIntensity = 9999; // default kilig wattage
    }

    function projectAura(address target) external {
        require(msg.sender == auraOwner, "Only VINVIN radiates this kilig");
        darkEntitiesNeutralized[target] = true;
        emit EntityMelted(target, "Natutunaw ang pagka-demonyo mo sa awra ni VINVIN");
    }

    function upgradeAwra(uint256 newLevel) external {
        require(msg.sender == auraOwner, "Only VINVIN can intensify the flame");
        auraIntensity = newLevel;
        emit AuraSurge(msg.sender, newLevel);
    }

    function isNeutralized(address soul) external view returns (bool) {
        return darkEntitiesNeutralized[soul];
    }
}
