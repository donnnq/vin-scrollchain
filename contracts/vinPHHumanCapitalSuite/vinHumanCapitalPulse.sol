// vinHumanCapitalPulse.sol

contract vinHumanCapitalPulse {
    mapping(address => uint) public emotionalAPR;
    event PulseLogged(address steward, uint aprScore);

    function logPulse(address _steward, uint _score) public {
        emotionalAPR[_steward] = _score;
        emit PulseLogged(_steward, _score);
    }
}
