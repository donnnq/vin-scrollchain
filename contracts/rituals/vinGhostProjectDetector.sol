// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinGhostProjectDetector {
    struct Project {
        string name;
        string location;
        uint256 budget;
        bool consultedWithMayor;
        bool hasBarangayImpact;
        bool isFlagged;
        string reasonFlagged;
    }

    Project[] public projects;

    event ProjectSubmitted(string name, string location);
    event ProjectFlagged(string name, string reason);

    function submitProject(
        string memory _name,
        string memory _location,
        uint256 _budget,
        bool _consultedWithMayor,
        bool _hasBarangayImpact
    ) public {
        bool _isFlagged = false;
        string memory _reasonFlagged = "";

        if (!_consultedWithMayor) {
            _isFlagged = true;
            _reasonFlagged = "Missing mayoral consultation";
        } else if (!_hasBarangayImpact) {
            _isFlagged = true;
            _reasonFlagged = "No barangay-level benefit";
        } else if (_budget > 100_000_000) {
            _isFlagged = true;
            _reasonFlagged = "Suspicious budget inflation";
        }

        projects.push(Project(_name, _location, _budget, _consultedWithMayor, _hasBarangayImpact, _isFlagged, _reasonFlagged));

        emit ProjectSubmitted(_name, _location);

        if (_isFlagged) {
            emit ProjectFlagged(_name, _reasonFlagged);
        }
    }

    function getProject(uint256 index) public view returns (Project memory) {
        return projects[index];
    }

    function totalProjects() public view returns (uint256) {
        return projects.length;
    }
}
