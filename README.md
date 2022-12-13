# DSB-LC

<div style='text-align: center;'>
    <h1>Ahmed Asaad<br>Sec: 1<br>B.N: 1</h1>
</div>

<div style='text-align: center;'>
    <h1><a href="https://github.com/ahmedasad236/DSB-LC">Source Code</a></h1>
    
</div>
<div style='text-align: center;'>
    <h2>Figures</h2>
</div>
<h3>Message Signal</h3>

<ul>
    <li>
        <h3>Time Domain</h3>
        <img src="./message_time.png">
    </li>
    <li>
        <h3>Spectrum</h3>
        <img src="./message_spectrum.png">
    </li>
    <li>
        <h3>Amplitude in Frequency Domain</h3>
        <img src="./message_amplitude.png">
    </li>
    <li>
        <h3>Phase in Frequency Domain</h3>
        <img src="./message_phase.png">
    </li>
</ul>

<h3>Modulated Signal</h3>
<ul>
    <li>
        <h3>Time Domain</h3>
        <img src="./modulated_time.png">
    </li>
    <li>
        <h3>Spectrum</h3>
        <img src="./modulated_spectrum.png">
    </li>
    <li>
        <h3>Amplitude in Frequency Domain</h3>
        <img src="./modulated_amplitude.png">
    </li>
    <li>
        <h3>Phase in Frequency Domain</h3>
        <img src="./modulated_phase.png">
    </li>
</ul>

<h3>Demodulated Signal</h3>
<ul>
    <li>
        <h3>Time Domain</h3>
        <img src="./demodulated_time.png">
    </li>
    <li>
        <h3>Spectrum</h3>
        <img src="./demodulated_spectrum.png">
    </li>
    <li>
        <h3>Amplitude in Frequency Domain</h3>
        <img src="./demodulated_amplitude.png">
    </li>
    <li>
        <h3>Phase in Frequency Domain</h3>
        <img src="./demodulated_phase.png">
    </li>
</ul>

<div style='text-align: center;border-top: 1px solid white;'>
    <h2>Explaination</h2>
</div>

<ul>
    <li>
        <h3>Chooseing A and w </h3>
        <div>
            I have choosed A with the absolute of minimum value of the message m(t) divided by the modulation index (mu)., 
            For w, I have choosed it as the quarter of the sampling rate.
        </div>
    </li>
    <li style="border-top: 1px solid white;">
        <h3>Problem with the AM signal when it is over-modulated</h3>
        <span>
            It will cause error for asynchronous demodulation using envelope detector, as there will be part of the signal in the negative part and the envelope would not detect it.
        </span>
    </li>
        <li style="border-top: 1px solid white;">
        <h3>Are the two signals, original and demodualted, the same?</h3>
        <span>
            Yes, They are almost the same. As we apply synchronous Amplitude modulation using the same carrier in the demodualtor.
        </span>
    </li>

</ul>