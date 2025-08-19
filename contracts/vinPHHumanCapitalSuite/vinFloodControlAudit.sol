// vinFloodControlAudit.sol

contract vinFloodControlAudit {
    address public steward;
    string public district;
    uint public auditScore;

    event AuditLogged(string district, uint score, string timestamp);

    function logAudit(string memory _district, uint _score) public {
        district = _district;
        auditScore = _score;
        emit AuditLogged(_district, _score, block.timestamp);
    }
}
