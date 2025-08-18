// SPDX-License-Identifier: Civic-Automation
pragma solidity ^0.8.0;

interface ITransparencySigil {
    function updateEligibility(string memory agency, bool status) external;
    function mintSigil(string memory agency) external;
}

interface ILumpSumTransparencyAudit {
    function hasPassedAudit(string memory agency) external view returns (bool);
}

contract vinAuditToSigilBridge {
    address public steward;
    ITransparencySigil public sigilContract;
    ILumpSumTransparencyAudit public auditContract;

    event BridgeActivated(string agency);
    event SigilAutoMinted(string agency);

    constructor(address _sigil, address _audit) {
        steward = msg.sender;
        sigilContract = ITransparencySigil(_sigil);
        auditContract = ILumpSumTransparencyAudit(_audit);
    }

    function activateBridge(string memory agency) public {
        require(msg.sender == steward, "Only steward may activate");
        require(auditContract.hasPassedAudit(agency), "Audit not passed");

        sigilContract.updateEligibility(agency, true);
        emit BridgeActivated(agency);

        sigilContract.mintSigil(agency);
        emit SigilAutoMinted(agency);
    }
}
