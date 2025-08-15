// SPDX-License-Identifier: MythicReplicator
pragma solidity ^0.8.0;

import "./ScrollManifest.sol";

contract ScrollManifestFactory {
    address public steward;
    ScrollManifest[] public deployedManifests;

    event ManifestForged(address indexed manifest, uint256 timestamp, string blessing);

    constructor() {
        steward = msg.sender;
    }

    function forgeManifest() public returns (address) {
        require(msg.sender == steward, "Only steward may forge scrolls");

        ScrollManifest newManifest = new ScrollManifest();
        deployedManifests.push(newManifest);

        emit ManifestForged(address(newManifest), block.timestamp, "🧙‍♂️ Scrolls forged. Civic resonance multiplied.");
        return address(newManifest);
    }

    function getManifest(uint index) public view returns (address) {
        require(index < deployedManifests.length, "Invalid index");
        return address(deployedManifests[index]);
    }

    function totalForged() public view returns (uint256) {
        return deployedManifests.length;
    }

    function stewardVow() public pure returns (string memory) {
        return "🏛️ I vow to deploy dignity, empathy, and prophecy scrolls across all cities and systems.";
    }
}
