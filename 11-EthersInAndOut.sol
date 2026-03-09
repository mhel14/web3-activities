// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract PayableFuncContract {
    // ACTIVITY 1 — First Payable Function
    mapping(address => uint) balances;
    event Withdrawn(address user, uint amount);

    function deposit() external payable {
        require(msg.value > 0, "Amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function getBalance(address _wallet) external view returns (uint) {
        return balances[_wallet];
    }

    // ACTIVITY 2 — Withdraw Your Funds
    function withdraw(uint _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Withdraw failed");
        emit Withdrawn(msg.sender, _amount);
    }
}
