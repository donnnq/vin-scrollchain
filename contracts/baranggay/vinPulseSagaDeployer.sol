// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./vinDigniPay.sol";
import "./vinUpliftLoan.sol";
import "./vinNationPulseAudit.sol";
import "./vinElderPulse.sol";
import "../tracking/vinProgressMirror.sol";
import "../tracking/vinCareCreditMirror.sol";
import "../baranggay/vinBarangaySurveyor.sol";
import "../baranggay/vinHospitScrollPass.sol";

contract vinPulseSagaDeployer {
    address public deployer;

    vinDigniPay public digniPay;
    vinUpliftLoan public upliftLoan;
    vinNationPulseAudit public nationAudit;
    vinElderPulse public elderPulse;
    vinProgressMirror public progressMirror;
    vinCareCreditMirror public creditMirror;
    vinBarangaySurveyor public barangaySurvey;
    vinHospitScrollPass public hospitPass;

    event ScrollSagaDeployed(string region);

    constructor(string memory regionLabel) {
        deployer = msg.sender;

        digniPay = new vinDigniPay();
        upliftLoan = new vinUpliftLoan();
        nationAudit = new vinNationPulseAudit();
        elderPulse = new vinElderPulse();
        progressMirror = new vinProgressMirror();
        creditMirror = new vinCareCreditMirror();
        barangaySurvey = new vinBarangaySurveyor();
        hospitPass = new vinHospitScrollPass();

        emit ScrollSagaDeployed(regionLabel);
    }

    function getScrolls() external view returns (
        address, address, address, address, address, address, address, address
    ) {
        return (
            address(digniPay),
            address(upliftLoan),
            address(nationAudit),
            address(elderPulse),
            address(progressMirror),
            address(creditMirror),
            address(barangaySurvey),
            address(hospitPass)
        );
    }
}
