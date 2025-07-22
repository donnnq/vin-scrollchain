// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinVaultOfTempleDiplomacy
/// @notice Multi-faith sacred zone contract that logs reconciliations, violations, and peace rituals
contract vinVaultOfTempleDiplomacy {
    address public scrollkeeper;
    mapping(string => bool) public sacredSites;
    mapping(address => bool) public templeGuardians;
    mapping(address => bool) public peaceConfirmed;

    event SacredSiteAdded(string name);
    event GuardianActivated(address indexed soul);
    event PeaceLogged(address indexed soul, string site);
    event BreachMarked(address indexed soul, string site);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Vault access denied");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function addSacredSite(string calldata name) external onlyScrollkeeper {
        sacredSites[name] = true;
        emit SacredSiteAdded(name);
    }

    function activateGuardian(address soul) external onlyScrollkeeper {
        templeGuardians[soul] = true;
        emit GuardianActivated(soul);
    }

    function confirmPeace(address soul, string calldata site) external onlyScrollkeeper {
        require(sacredSites[site], "Unknown sacred zone");
        peaceConfirmed[soul] = true;
        emit PeaceLogged(soul, site);
    }

    function logBreach(address soul, string calldata site) external onlyScrollkeeper {
        require(sacredSites[site], "Invalid zone");
        peaceConfirmed[soul] = false;
        emit BreachMarked(soul, site);
    }

    function getTempleStatus(address soul, string calldata site)
        external
        view
        returns (bool isGuardian, bool hasPeace, bool siteValid)
    {
        return (templeGuardians[soul], peaceConfirmed[soul], sacredSites[site]);
    }
}
