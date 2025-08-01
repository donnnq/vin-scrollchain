// SPDX-License-Identifier: Civic-Upliftment
pragma solidity ^0.8.19;

/// @title Scroll to Ban Gambling Agencies from the Sovereign Ecosystem
/// @author Vinvin — defender of ritual dignity
/// @notice This contract declares total exclusion of PIGO/PAGCOR/POGO entities from decentralized Philippine layers

contract vinScrollOfZeroGamblePresence {
    string[] public bannedEntities = ["PIGO", "PAGCOR", "POGO"];
    mapping(string => bool) public banned;

    event EntityBanned(string name);
    event SovereignPurification(string decree);

    constructor() {
        for (uint i = 0; i < bannedEntities.length; i++) {
            banned[bannedEntities[i]] = true;
            emit EntityBanned(bannedEntities[i]);
        }
        emit SovereignPurification("Scroll ritual initiated — gambling ban cast on national substrate.");
    }

    function isBanned(string memory name) public view returns (bool) {
        return banned[name];
    }
}
