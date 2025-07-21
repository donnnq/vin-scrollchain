// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinStablecoinGatekeeper {
    event LicenseOffered(address indexed candidate, string projectName, uint256 timestamp);
    event LicenseApproved(address indexed issuer, string stablecoinSymbol, uint256 timestamp);

    struct Candidate {
        string projectName;
        string useCase;
        bool riskCompliant;
        bool amlCompliant;
        bool invited;
        bool licensed;
        string stablecoinSymbol;
    }

    mapping(address => Candidate) public whitelist;

    modifier onlyInvited(address _issuer) {
        require(whitelist[_issuer].invited, "Issuer has not received scrollkeeper invitation.");
        _;
    }

    function offerLicense(address _candidate, string calldata _projectName, string calldata _useCase) external {
        whitelist[_candidate] = Candidate({
            projectName: _projectName,
            useCase: _useCase,
            riskCompliant: false,
            amlCompliant: false,
            invited: true,
            licensed: false,
            stablecoinSymbol: ""
        });

        emit LicenseOffered(_candidate, _projectName, block.timestamp);
    }

    function approveLicense(address _issuer, string calldata _symbol) external onlyInvited(_issuer) {
        Candidate storage c = whitelist[_issuer];
        require(!c.licensed, "Already licensed.");
        require(c.riskCompliant && c.amlCompliant, "Issuer must meet all compliance rituals.");

        c.licensed = true;
        c.stablecoinSymbol = _symbol;

        emit LicenseApproved(_issuer, _symbol, block.timestamp);
    }

    function setComplianceStatus(address _issuer, bool _risk, bool _aml) external {
        Candidate storage c = whitelist[_issuer];
        require(c.invited, "Issuer not whitelisted yet.");
        c.riskCompliant = _risk;
        c.amlCompliant = _aml;
    }

    function viewIssuer(address _issuer) external view returns (Candidate memory) {
        return whitelist[_issuer];
    }
}
