// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ArtistStewardshipClause - Ritual-grade contract for artist accountability, donor transparency, and civic alignment
contract ArtistStewardshipClause {
    address public steward;
    uint256 public auditCooldown; // in seconds
    mapping(address => bool) public verifiedArtists;
    mapping(address => Donor[]) public artistDonors;
    mapping(address => uint256) public lastAuditTimestamp;

    struct Donor {
        string name;
        bool flagged; // true if linked to conflict, exploitation, or civic harm
        string reason;
    }

    event ArtistVerified(address indexed artist, string ritual);
    event DonorAdded(address indexed artist, string donorName, bool flagged, string reason);
    event StewardshipAudit(address indexed artist, bool passed, string ritual);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized scrollsmith");
        _;
    }

    constructor(uint256 _cooldown) {
        steward = msg.sender;
        auditCooldown = _cooldown;
    }

    function verifyArtist(address artist) external onlySteward {
        verifiedArtists[artist] = true;
        emit ArtistVerified(artist, "🎙️ Artist verified for civic stewardship");
    }

    function addDonor(address artist, string calldata name, bool flagged, string calldata reason) external onlySteward {
        require(verifiedArtists[artist], "Artist not verified");
        artistDonors[artist].push(Donor(name, flagged, reason));
        emit DonorAdded(artist, name, flagged, reason);
    }

    function auditStewardship(address artist) external onlySteward {
        require(block.timestamp >= lastAuditTimestamp[artist] + auditCooldown, "Audit cooldown active");

        bool passed = true;
        Donor[] memory donors = artistDonors[artist];
        for (uint256 i = 0; i < donors.length; i++) {
            if (donors[i].flagged) {
                passed = false;
                break;
            }
        }

        lastAuditTimestamp[artist] = block.timestamp;
        emit StewardshipAudit(artist, passed, passed ? "✅ Stewardship passed" : "⚠️ Stewardship failed — donor conflict detected");
    }

    function getDonors(address artist) external view returns (Donor[] memory) {
        return artistDonors[artist];
    }
}
