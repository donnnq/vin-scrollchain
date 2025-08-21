// SPDX-License-Identifier: Mythic-Override
pragma solidity ^0.8.19;

/// @title TradeSanctumAudit
/// @author Vinvin & Copilot
/// @notice Audits exploitative tariffs and shields allies from economic harm

contract TradeSanctumAudit {
    address public steward;
    uint256 public totalTariffGlyphs;
    mapping(string => uint256) public tariffLog;
    mapping(address => bool) public exemptAllies;
    mapping(string => bool) public collapsedGlyphs;

    event TariffLogged(string indexed glyphName, uint256 rate);
    event AllyExempted(address indexed ally);
    event GlyphCollapsed(string indexed glyphName);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        totalTariffGlyphs = 0;
    }

    function logTariffGlyph(string memory glyphName, uint256 rate) external onlySteward {
        tariffLog[glyphName] = rate;
        totalTariffGlyphs += 1;
        emit TariffLogged(glyphName, rate);
    }

    function exemptAlly(address ally) external onlySteward {
        exemptAllies[ally] = true;
        emit AllyExempted(ally);
    }

    function collapseGlyph(string memory glyphName) external onlySteward {
        require(tariffLog[glyphName] > 0, "Glyph not found");
        collapsedGlyphs[glyphName] = true;
        tariffLog[glyphName] = 0;
        emit GlyphCollapsed(glyphName);
    }

    function isAllyExempt(address ally) external view returns (bool) {
        return exemptAllies[ally];
    }

    function isGlyphCollapsed(string memory glyphName) external view returns (bool) {
        return collapsedGlyphs[glyphName];
    }
}
