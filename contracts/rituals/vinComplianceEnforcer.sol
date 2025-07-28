// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinComplianceEnforcer {
    struct Subject {
        string name;
        string passport;
        bool visaValid;
        bool involvedInViolation;
        bool reported;
        bool detained;
    }

    mapping(address => Subject) public subjects;

    event ReportFiled(address indexed subject, string reason);
    event DetentionTriggered(address indexed subject);
    event Cleared(address indexed subject);

    function fileReport(
        address _subject,
        string memory _name,
        string memory _passport,
        bool _visaValid,
        bool _involvedInViolation,
        string memory _reason
    ) public {
        subjects[_subject] = Subject(
            _name,
            _passport,
            _visaValid,
            _involvedInViolation,
            true,
            false
        );
        emit ReportFiled(_subject, _reason);
    }

    function processDetention(address _subject) public {
        require(subjects[_subject].reported, "No report filed.");
        require(subjects[_subject].involvedInViolation, "No violation detected.");
        require(!subjects[_subject].visaValid, "Subject has valid visa.");

        subjects[_subject].detained = true;
        emit DetentionTriggered(_subject);
    }

    function clearSubject(address _subject) public {
        subjects[_subject].detained = false;
        emit Cleared(_subject);
    }

    function getSubjectStatus(address _subject) public view returns (string memory status) {
        if (subjects[_subject].detained) {
            return "Detained";
        } else if (subjects[_subject].reported) {
            return "Under review";
        } else {
            return "Clear";
        }
    }
}
