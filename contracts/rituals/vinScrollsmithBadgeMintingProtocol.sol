// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinScrollsmithBadgeMintingProtocol.sol
/// @author Vinvin, Mythic Architect of Civic Resonance
/// @notice Mints soulbound honor badges for verified stewards of compassion and dignity

contract vinScrollsmithBadgeMintingProtocol {
    address public steward;

    enum BadgeType {
        StewardOfTheSilenced,
        DefenderOfDignity,
        GlobalResonanceChampion,
        ScrollchainPurifier,
        PamanaGuardian
    }

    struct Badge {
        BadgeType badgeType;
        string institutionName;
        uint256 emotionalAPR;
        bool minted;
    }

    mapping(address => Badge) public badgeLedger;
    address[] public badgeRegistry;

    event BadgeMinted(address indexed recipient, BadgeType badgeType, string institutionName, uint256 emotionalAPR);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    /// @notice Mint a soulbound badge for a verified institution
    function mintBadge(address recipient, BadgeType badgeType, string memory name, uint256 apr) public onlySteward {
        require(!badgeLedger[recipient].minted, "Badge already minted");

        badgeLedger[recipient] = Badge(badgeType, name, apr, true);
        badgeRegistry.push(recipient);

        emit BadgeMinted(recipient, badgeType, name, apr);
    }

    /// @notice View badge details
    function getBadge(address recipient) public view returns (Badge memory) {
        return badgeLedger[recipient];
    }

    /// @notice View all badge holders
    function getBadgeRegistry() public view returns (address[] memory) {
        return badgeRegistry;
    }
}
