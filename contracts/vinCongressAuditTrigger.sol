// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinCongressAuditTrigger {
    struct Congressman {
        address wallet;
        string name;
        bool registered;
        bool underAudit;
        bool provenCorrupt;
    }

    mapping(address => Congressman) public congressmen;
    address public auditCommissioner;

    event CongressmanRegistered(address indexed wallet, string name);
    event AuditTriggered(address indexed wallet);
    event VerdictDeclared(address indexed wallet, bool provenCorrupt);

    modifier onlyCommissioner() {
        require(msg.sender == auditCommissioner, "Not authorized");
        _;
    }

    constructor() {
        auditCommissioner = msg.sender;
    }

    function registerCongressman(address _wallet, string calldata _name) external onlyCommissioner {
        congressmen[_wallet] = Congressman(_wallet, _name, true, false, false);
        emit CongressmanRegistered(_wallet, _name);
    }

    function triggerAudit(address _wallet) external onlyCommissioner {
        require(congressmen[_wallet].registered, "Not registered");
        congressmen[_wallet].underAudit = true;
        emit AuditTriggered(_wallet);
    }

    function declareVerdict(address _wallet, bool _corrupt) external onlyCommissioner {
        require(congressmen[_wallet].underAudit, "Audit not triggered");
        congressmen[_wallet].provenCorrupt = _corrupt;
        emit VerdictDeclared(_wallet, _corrupt);
        // Optionally: forward result to signal relay or sanction engine
    }
}
