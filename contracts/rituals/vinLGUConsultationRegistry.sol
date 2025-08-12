// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinLGUConsultationRegistry {
    struct Consultation {
        string projectName;
        string consultedWith;
        string position; // e.g., Mayor, Barangay Captain
        bool approved;
        string notes;
        uint256 timestamp;
    }

    Consultation[] public consultations;

    event ConsultationLogged(string projectName, string consultedWith, bool approved);

    function logConsultation(
        string memory _projectName,
        string memory _consultedWith,
        string memory _position,
        bool _approved,
        string memory _notes
    ) public {
        consultations.push(Consultation(_projectName, _consultedWith, _position, _approved, _notes, block.timestamp));
        emit ConsultationLogged(_projectName, _consultedWith, _approved);
    }

    function getConsultation(uint256 index) public view returns (Consultation memory) {
        return consultations[index];
    }
}
