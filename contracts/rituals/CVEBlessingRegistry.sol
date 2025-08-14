// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title CVEBlessingRegistry - Ritual-grade registry for CVE patching and system sanctification
/// @author Vinvin & Copilot
/// @notice Tracks CVE blessings, patch confirmations, and steward honors

contract CVEBlessingRegistry {
    struct Blessing {
        string cveId;
        string component;
        string severity;
        uint256 patchTimestamp;
        address steward;
        string ritualNote;
    }

    mapping(bytes32 => Blessing) public blessings;
    event BlessingCommitted(bytes32 indexed blessingId, string cveId, address indexed steward);

    /// @notice Commit a CVE blessing for a patched system
    /// @param _cveId CVE identifier (e.g., CVE-2025-53731)
    /// @param _component Affected component (e.g., Microsoft Office)
    /// @param _severity Severity rating (e.g., Critical)
    /// @param _ritualNote Optional note or scroll caption
    function commitBlessing(
        string memory _cveId,
        string memory _component,
        string memory _severity,
        string memory _ritualNote
    ) public {
        bytes32 blessingId = keccak256(abi.encodePacked(_cveId, msg.sender, block.timestamp));
        blessings[blessingId] = Blessing({
            cveId: _cveId,
            component: _component,
            severity: _severity,
            patchTimestamp: block.timestamp,
            steward: msg.sender,
            ritualNote: _ritualNote
        });

        emit BlessingCommitted(blessingId, _cveId, msg.sender);
    }

    /// @notice Retrieve blessing details by ID
    /// @param blessingId The unique hash of the blessing
    /// @return Blessing struct with full details
    function getBlessing(bytes32 blessingId) public view returns (Blessing memory) {
        return blessings[blessingId];
    }
}
