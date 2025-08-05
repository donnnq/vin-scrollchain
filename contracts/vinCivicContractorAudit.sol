// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinCivicContractorAudit {
    struct RedemptionPlea {
        string officialName;
        string statement;
        uint256 timestamp;
    }

    struct ContractorLink {
        string contractorName;
        string linkedOfficial;
        string projectName;
        uint256 budgetAmount;
        string regionCode;
    }

    address public civicArchivist;
    RedemptionPlea[] public redemptionLog;
    ContractorLink[] public contractorLinks;

    event PleaLogged(string official, string statement, uint256 time);
    event LinkRecorded(string contractor, string official, string project);

    modifier onlyArchivist() {
        require(msg.sender == civicArchivist, "Unauthorized scroll attempt");
        _;
    }

    constructor() {
        civicArchivist = msg.sender;
    }

    function submitRedemption(string memory _name, string memory _statement) public onlyArchivist {
        redemptionLog.push(RedemptionPlea(_name, _statement, block.timestamp));
        emit PleaLogged(_name, _statement, block.timestamp);
    }

    function trackContractor(string memory _contractorName, string memory _linkedOfficial, string memory _projectName, uint256 _budget, string memory _regionCode) public onlyArchivist {
        contractorLinks.push(ContractorLink(_contractorName, _linkedOfficial, _projectName, _budget, _regionCode));
        emit LinkRecorded(_contractorName, _linkedOfficial, _projectName);
    }

    function fetchAuditLore() public view returns (RedemptionPlea[] memory, ContractorLink[] memory) {
        return (redemptionLog, contractorLinks);
    }
}
