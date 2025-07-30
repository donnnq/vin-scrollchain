// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinEthicalEmployers {
    address public scrollsmith;
    uint public employerCount;

    struct Employer {
        string orgName;
        string sector;
        string philosophy;
        bool certifiedUplifting;
    }

    mapping(uint => Employer) public employerScrolls;

    event EmployerRegistered(string orgName, string sector, string philosophy);
    event EthicsUpdated(uint employerId, bool certifiedUplifting);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        employerCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only scrollsmith can edit the scrolls of virtue.");
        _;
    }

    // 📝 Register an employer with values-based metadata
    function registerEmployer(
        string memory orgName,
        string memory sector,
        string memory philosophy,
        bool certifiedUplifting
    ) public onlyScrollsmith {
        employerScrolls[employerCount++] = Employer(orgName, sector, philosophy, certifiedUplifting);
        emit EmployerRegistered(orgName, sector, philosophy);
    }

    // 🔍 Update ethical certification
    function updateEthics(uint employerId, bool certifiedUplifting) public onlyScrollsmith {
        require(employerId < employerCount, "Employer does not exist.");
        employerScrolls[employerId].certifiedUplifting = certifiedUplifting;
        emit EthicsUpdated(employerId, certifiedUplifting);
    }

    // 📜 View employer scroll
    function getEmployer(uint id) public view returns (
        string memory orgName,
        string memory sector,
        string memory philosophy,
        bool certifiedUplifting
    ) {
        Employer memory e = employerScrolls[id];
        return (e.orgName, e.sector, e.philosophy, e.certifiedUplifting);
    }

    // 🧙 Transfer scrollsmith rights
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid scrollsmith address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 📊 Metrics
    function totalEmployers() public view returns (uint) {
        return employerCount;
    }
}
