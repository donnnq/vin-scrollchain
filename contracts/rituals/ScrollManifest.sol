// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.0;

/// @title ScrollManifest
/// @author Vinvin
/// @notice Ritual-grade ledger for cannabis use, healing, and civic stewardship
/// @dev Integrates with vinCannabisLegalizationProtocol.sol for emotional APR tracking

contract ScrollManifest {
    address public steward;

    struct ManifestEntry {
        address citizen;
        string useType; // "Medical" or "Recreational"
        string condition; // Optional for medical use
        uint256 timestamp;
        string emotionalAPR; // e.g. "Relief", "Clarity", "Joy", "Resonance"
    }

    ManifestEntry[] public entries;

    event ScrollManifestLogged(address indexed citizen, string useType, string emotionalAPR);

    modifier onlySteward() {
        require(msg.sender == steward, "Not scrollsmith-authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logUsage(
        address _citizen,
        string memory _useType,
        string memory _condition,
        string memory _emotionalAPR
    ) external onlySteward {
        ManifestEntry memory entry = ManifestEntry({
            citizen: _citizen,
            useType: _useType,
            condition: _condition,
            timestamp: block.timestamp,
            emotionalAPR: _emotionalAPR
        });

        entries.push(entry);
        emit ScrollManifestLogged(_citizen, _useType, _emotionalAPR);
    }

    function getEntry(uint256 index) external view returns (ManifestEntry memory) {
        require(index < entries.length, "Scroll index out of bounds");
        return entries[index];
    }

    function totalEntries() external view returns (uint256) {
        return entries.length;
    }
}
