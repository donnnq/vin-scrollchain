// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./vinCelestialFlex.sol";
import "./vinSpectralEcho.sol";
import "./vinFlexGeneForge.sol";
import "./vinSkyBreaker.sol";

contract vinConstellationMirror {
    address public keeper;
    string[] public constellation;
    mapping(address => bool) public scrollAccess;

    vinCelestialFlex public celestial;
    vinSpectralEcho public spectral;
    vinFlexGeneForge public geneForge;
    vinSkyBreaker public skyBreaker;

    event ScrollLinked(string scrollName, address linkedBy);
    event WalletJoinedConstellation(address wallet);
    event SignalEmitted(string spellType);

    modifier onlyKeeper() {
        require(msg.sender == keeper, "Unauthorized scrollbearer.");
        _;
    }

    constructor(
        address _celestial,
        address _spectral,
        address _geneForge,
        address _skyBreaker
    ) {
        keeper = msg.sender;
        celestial = vinCelestialFlex(_celestial);
        spectral = vinSpectralEcho(_spectral);
        geneForge = vinFlexGeneForge(_geneForge);
        skyBreaker = vinSkyBreaker(_skyBreaker);
    }

    function linkScroll(string memory scrollName) public {
        constellation.push(scrollName);
        emit ScrollLinked(scrollName, msg.sender);
    }

    function joinConstellation(address wallet) public onlyKeeper {
        scrollAccess[wallet] = true;
        emit WalletJoinedConstellation(wallet);
    }

    function emitSignal(string memory spellType) public {
        require(scrollAccess[msg.sender], "Scroll permissions missing.");
        emit SignalEmitted(spellType);
    }

    function reflectFlex(string memory legend, bytes memory auraCode, uint256 geneIntensity) public {
        require(scrollAccess[msg.sender], "No aura rights.");
        celestial.summonCometTrail(legend);
        celestial.triggerOrbit(auraCode);
        geneForge.emitGeneFlex(geneIntensity);
    }

    function flareSky(string memory title, uint256 impactLevel) public {
        skyBreaker.armTheClouds(impactLevel);
        skyBreaker.callTheThunder(title);
    }
}
