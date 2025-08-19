// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.0;

contract vinBadgeOfVanishingMint {
    address public steward;
    mapping(address => bool) public badgeMinted;

    event BadgeMinted(address indexed contractor, string badgeType);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized mythic steward");
        _;
    }

    function mintVanishingBadge(address contractor) public onlySteward {
        require(!badgeMinted[contractor], "Badge already minted");
        badgeMinted[contractor] = true;
        emit BadgeMinted(contractor, "🫥 Badge of Vanishing");
    }
}
